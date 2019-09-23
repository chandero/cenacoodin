unit UnitResumenColocaciones;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, IBSQL, DB, IBCustomDataSet, IBQuery,
  UnitPantallaProgreso, IBEvents, pr_Common, pr_TxClasses, DBClient,
  ComCtrls, UnitDmGeneral;

type
  TfrmResumenColocaciones = class(TForm)
    Panel1: TPanel;
    CmdProcesar: TBitBtn;
    CmdCerrar: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    IBQuery1: TIBQuery;
    IBSQL3: TIBSQL;
    IBSQL4: TIBSQL;
    IBQVarios: TIBQuery;
    CmdReporte: TBitBtn;
    IBSQL1: TIBSQL;
    Reporte: TprTxReport;
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
    Rarrastre: TprTxReport;
    BitBtn1: TBitBtn;
    CDArrastreid_colocacion: TStringField;
    EdFecha: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure CmdProcesarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure CmdReporteClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PrimerPaso;
    function EvaluarEdad(Clasificacion,Garantia,Dias: Integer): string;
    procedure SegundoPaso;
    procedure ley_arrastre;
    function verifica_arrastre(id_persona: string;
      id_identificacion: integer): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResumenColocaciones: TfrmResumenColocaciones;
  dmGeneral : TdmGeneral;
  TablaTmp:string;
  Total:Integer;
  Procesado:Boolean;
  frmPantallaProgreso:TfrmProgreso;
implementation

{$R *.dfm}

uses UnitGlobales, UnitGlobalesCol, UnitVistaPreliminar;

procedure TfrmResumenColocaciones.FormShow(Sender: TObject);
begin
        EdFecha.Date := fFechaActual;
        EdFecha.MinDate := fFechaActual;
end;

procedure TfrmResumenColocaciones.PrimerPaso;
var I :Integer;
    FechaInicial:TDate;
    FechaFinal:TDate;
    Saldo:Currency;
    Dias,DiasCorrientes:Integer;
    Edad:string;
begin
        frmPantallaProgreso := TfrmProgreso.Create(Self);
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
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;

            Total := FieldByName('TOTAL').AsInteger;

            Close;
            SQL.Clear;
//            SQL.Add('select * from P_COL_004 WHERE ID_COLOCACION = :ID');
            SQL.Add('select * from P_COL_004');
//            ParamByName('ID').AsString := '20060003874';
            try
             Open;
            except
             Transaction.Rollback;
             frmPantallaProgreso.Cerrar;
             raise;
             Exit;
            end;
         end;
            frmPantallaProgreso.Min := 0;
            frmPantallaProgreso.Max := Total;
            frmPantallaProgreso.Position := 0;
            frmPantallaProgreso.InfoLabel := 'Procesando Resumen de Colocaciones';
            frmpantallaprogreso.Ejecutar;
            while not IBQuery1.Eof do
            begin
                frmPantallaProgreso.Position := IBQuery1.RecNo;
                Application.ProcessMessages;
                FechaInicial := IBQuery1.FieldByName('FECHA_INTERES').AsDateTime;
                FechaFinal := EdFecha.Date;
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
                 frmPantallaProgreso.Cerrar;
                 raise;
                 Exit;
                end;// try
                Saldo := IBQuery1.FieldByName('SALDO').AsCurrency;
                Dias := ObtenerDiasMora(IBQuery1.FieldByName('ID_AGENCIA').AsInteger,IBQuery1.FieldByName('ID_COLOCACION').AsString,IBSQL1);
                DiasCorrientes := Dias;
// Evaluar Edad
//            if IBQuery1.FieldByName('TIPOC_INTERES').AsString = 'V' then
//               Dias := Dias - IBQuery1.FieldByName('AMORTIZA_INTERES').AsInteger;
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
                 frmProgreso.Cerrar;
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
            frmPantallaProgreso.Cerrar;
            Application.ProcessMessages;

            end;

procedure TfrmResumenColocaciones.SegundoPaso;
var id_ant:Integer;
    pr_ant:string;
    edad_ant:string;
    primerpaso:Boolean;
    vAportes:Currency;
    AportesCon:Currency;
    Deuda:Currency;
begin
          frmPantallaProgreso  := TfrmProgreso.Create(Self);
          frmPantallaProgreso.Min := 0;
          frmPantallaProgreso.Max := Total;
          frmPantallaProgreso.InfoLabel := 'Aplicando Ley de Arrastre';
          frmPantallaProgreso.Position := 0;
          frmPantallaProgreso.Ejecutar;
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
            frmProgreso.Cerrar;
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
              frmPantallaProgreso.Position := IBQuery1.RecNo;
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
                      frmPantallaProgreso.Cerrar;
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
          frmPantallaProgreso.Cerrar;
end;

procedure TfrmResumenColocaciones.CmdProcesarClick(Sender: TObject);
begin

     CmdProcesar.Enabled := False;
     Application.ProcessMessages;
     Procesado := True;
     PrimerPaso;
     SegundoPaso;
end;

function TfrmResumenColocaciones.EvaluarEdad(Clasificacion,
  Garantia,Dias: Integer): string;
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
procedure TfrmResumenColocaciones.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmResumenColocaciones.CmdReporteClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
begin
        Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;

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
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := Reporte;
           frmVistaPreliminar.ShowModal;
        end;
end;

procedure TfrmResumenColocaciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if Procesado then
           with IBSQL1 do begin
             Close;
             SQL.Clear;
             SQL.Add('delete from "col$resumen"');
             try
              ExecQuery;
              Transaction.Commit;
             finally
              Action := caFree;
             end;
           end;

           dmGeneral.Free;

end;

procedure TfrmResumenColocaciones.ley_arrastre;
var     controla_persona :Boolean;
        id_persona_a :string;
        id_identificacion_a,total_c :Integer;
        nombre_a,cedula :string;
begin
        cedula := '';
        with IBQuery1 do
        begin
          Close;
          SQL.Clear;
          SQL.Add('select count(*) as total from "col$resumen"');
          Open;
          Last;
          total_c := FieldByName('total').AsInteger;
          SQL.Clear;
          SQL.Add('SELECT');
          SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
          SQL.Add('"col$garantia".DESCRIPCION_GARANTIA,');
          SQL.Add('"col$resumen".ID_AGENCIA,');
          SQL.Add('"col$resumen".ID_COLOCACION,');
          SQL.Add('"col$resumen".ID_EDAD,');
          SQL.Add('"col$resumen".ID_ARRASTRE,');
          SQL.Add('"col$resumen".FECHA_INTERES,');          
          SQL.Add('"col$resumen".ID_IDENTIFICACION,');
          SQL.Add('"col$resumen".ID_PERSONA,');
          SQL.Add('"col$resumen".VALOR,');
          SQL.Add('"col$resumen".DEUDA');
          SQL.Add('FROM');
          SQL.Add('"col$resumen"');
          SQL.Add('INNER JOIN "col$clasificacion" ON ("col$resumen".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
          SQL.Add('INNER JOIN "col$garantia" ON ("col$resumen".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
          SQL.Add('order by ID_IDENTIFICACION,ID_PERSONA,ID_EDAD DESC');
          Open;
          if RecordCount <> 0 then
          begin
            frmPantallaProgreso  := TfrmProgreso.Create(Self);
            frmPantallaProgreso.Max := total_c;
            frmPantallaProgreso.Min := 0;
            frmPantallaProgreso.Infolabel := 'Procesando L. de Arrastre';
            frmPantallaProgreso.Position := 0;
            frmPantallaProgreso.Ejecutar;
            while not Eof do
            begin
            frmPantallaProgreso.Position := RecNo;
            Application.ProcessMessages;
            if cedula <> FieldByName('ID_PERSONA').AsString then
            begin
               with IBSQL1 do
               begin
                 Close;
                 SQL.Clear;
                 SQL.Add('select NOMBRE,PRIMER_APELLIDO,SEGUNDO_APELLIDO from "gen$persona"');
                 SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                 ParamByName('ID_PERSONA').AsString := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 ParamByName('ID_IDENTIFICACION').AsInteger := IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 ExecQuery;
                 nombre_a := FieldByName('NOMBRE').AsString + ' ' + FieldByName('PRIMER_APELLIDO').AsString + ' '+FieldByName('SEGUNDO_APELLIDO').AsString;
               end;
            end;
              if verifica_arrastre(FieldByName('ID_PERSONA').AsString,fieldbyname('ID_IDENTIFICACION').AsInteger) then
              begin
                 CDArrastre.Append;
                 CDArrastre.FieldValues['id_persona'] := IBQuery1.FieldByName('ID_PERSONA').AsString;
                 CDArrastre.FieldValues['id_identificacion']:= IBQuery1.FieldByName('ID_IDENTIFICACION').AsInteger;
                 CDArrastre.FieldValues['nombre'] := nombre_a;
                 CDArrastre.FieldValues['id_edad']:= IBQuery1.FieldByName('ID_EDAD').AsString;
                 CDArrastre.FieldValues['v_desembolso'] := IBQuery1.FieldByName('VALOR').AsCurrency;
                 CDArrastre.FieldValues['garantia'] := IBQuery1.FieldByName('DESCRIPCION_GARANTIA').AsString;
                 CDArrastre.FieldValues['fecha_interes'] := IBQuery1.FieldByName('FECHA_INTERES').ASDATETIME;
                 CDArrastre.FieldValues['saldo'] := IBQuery1.FieldByName('DEUDA').AsCurrency;
                 CDArrastre.FieldValues['clasificacion'] := IBQuery1.FieldByName('DESCRIPCION_CLASIFICACION').AsString;
                 CDArrastre.FieldValues['id_colocacion'] := IBQuery1.FieldByName('ID_COLOCACION').AsString;
                 CDArrastre.Post;
              end;
              cedula := FieldByName('ID_PERSONA').AsString;
              Next;
            end;//fin del primer while
            frmPantallaProgreso.Cerrar;
          end;
        end;
end;

function TfrmResumenColocaciones.verifica_arrastre(id_persona: string;
  id_identificacion: integer): boolean;
var  edad_1,edad_2 :string;
begin
            Edad_1 := '';
            Edad_2 := '';
            Result := False;
            with IBSQL3 do
            begin
              Close;
              SQL.Clear;
              SQL.Add('select count(ID_PERSONA) as NUMERO from "col$resumen"');
              SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
              ParamByName('ID_PERSONA').AsString := id_persona;
              ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
              ExecQuery;
              if FieldByName('NUMERO').AsInteger > 1 then
              begin
                 with IBSQL4 do
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('select ID_EDAD from "col$resumen"');
                   SQL.Add('where ID_PERSONA = :ID_PERSONA and ID_IDENTIFICACION = :ID_IDENTIFICACION');
                   ParamByName('ID_PERSONA').AsString := id_persona;
                   ParamByName('ID_IDENTIFICACION').AsInteger := id_identificacion;
                   ExecQuery;
                   edad_1 := FieldByName('ID_EDAD').AsString;
                   Next;
                   while not Eof do
                   begin
                     if edad_1 <> FieldByName('ID_EDAD').AsString then
                     begin
                        Result := True;
                        Break;
                     end
                     else
                        edad_1 := FieldByName('ID_EDAD').AsString;
                     Next;
                    end;
                 end;
               end
               else
                   Result := False;
            end;

end;

procedure TfrmResumenColocaciones.BitBtn1Click(Sender: TObject);
begin
        CDArrastre.CancelUpdates;
        ley_arrastre;
        Empleado;
        Rarrastre.Variables.ByName['empresa'].AsString := Empresa;
        Rarrastre.Variables.ByName['nit'].AsString := Nit;
        Rarrastre.Variables.ByName['empleado'].AsString := Nombres +' ' + Apellidos;
        Rarrastre.Variables.ByName['hoy'].AsDateTime := EdFecha.Date ;
        if Rarrastre.PrepareReport then begin
           frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
           frmVistaPreliminar.Reporte := Rarrastre;
           frmVistaPreliminar.ShowModal;
        end;

end;

procedure TfrmResumenColocaciones.FormCreate(Sender: TObject);
begin
        dmGeneral := TdmGeneral.Create(self);
        dmGeneral.getConnected;

        IBQuery1.Database := dmGeneral.IBDatabase1;
        IBQVarios.Database := dmGeneral.IBDatabase1;
        IBSQL1.Database := dmGeneral.IBDatabase1;
        IBSQL3.Database := dmGeneral.IBDatabase1;
        IBSQL4.Database := dmGeneral.IBDatabase1;

        IBQuery1.Transaction := dmGeneral.IBTransaction1;
        IBQVarios.Transaction := dmGeneral.IBTransaction1;
        IBSQL1.Transaction := dmGeneral.IBTransaction1;
        IBSQL3.Transaction := dmGeneral.IBTransaction1;
        IBSQL4.Transaction := dmGeneral.IBTransaction1;

end;

end.
