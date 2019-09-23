unit Unit_RecInformeColocacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_Parser;

type
  TfrmRecuperarInformeColocacion = class(TForm)
    EdColocacion: TLabeledEdit;
    Panel1: TPanel;
    CmdCerrar: TBitBtn;
    CmdGrabar: TBitBtn;
    IBQuerycontable: TIBQuery;
    IBQuerycolocacion: TIBQuery;
    IBQuerytabla: TIBQuery;
    IBQueryGarReal: TIBQuery;
    IBQueryGarPersonal: TIBQuery;
    Report: TprTxReport;
    procedure CmdGrabarClick(Sender: TObject);
    procedure EdColocacionExit(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdColocacionKeyPress(Sender: TObject; var Key: Char);
    procedure ReportUnknownObjFunction(Sender: TObject;
      Component: TComponent; const FuncName: String;
      const Parameters: TprVarsArray; ParametersCount: Integer;
      var Value: TprVarValue; var IsProcessed: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRecuperarInformeColocacion: TfrmRecuperarInformeColocacion;
  vIdColocacion:String;
  vDesembolso:Currency;
  Saldo:Currency;
implementation

uses UnitdmColocacion,UnitGlobales, UnitVistaPreliminar, UnitGlobalesCol;

{$R *.dfm}

procedure TfrmRecuperarInformeColocacion.CmdGrabarClick(Sender: TObject);
var frmVistaPreliminar:TfrmVistaPreliminar;
TasaNominal : Double;
PuntosAdic : Double;
begin
        if DmColocacion.IBDScolocacion.Transaction.InTransaction Then
           DmColocacion.IBDScolocacion.Transaction.CommitRetaining;

        with IBQuerycolocacion do
        begin
             SQL.Clear;
             SQL.Add('SELECT "col$colocacion".ID_COLOCACION, "col$colocacion".ID_PERSONA, "gen$persona".NOMBRE,');
             SQL.Add('"gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
             SQL.Add('"gen$tiposidentificacion".DESCRIPCION_IDENTIFICACION,');
             SQL.Add('"col$clasificacion".DESCRIPCION_CLASIFICACION,');
             SQL.Add('"col$lineas".DESCRIPCION_LINEA,"col$inversion".DESCRIPCION_INVERSION,');
             SQL.Add('"col$respaldo".DESCRIPCION_RESPALDO,"col$garantia".DESCRIPCION_GARANTIA,');
             SQL.Add('"col$colocacion".FECHA_DESEMBOLSO,"col$colocacion".VALOR_DESEMBOLSO,');
             SQL.Add('"col$colocacion".PLAZO_COLOCACION,"col$colocacion".FECHA_VENCIMIENTO,');
             SQL.Add('"col$colocacion".TIPO_INTERES,"col$tasasvariables".DESCRIPCION_TASA,');
             SQL.Add('"col$colocacion".TASA_INTERES_CORRIENTE,"col$colocacion".TASA_INTERES_MORA,');
             SQL.Add('"col$colocacion".PUNTOS_INTERES,"col$tiposcuota".DESCRIPCION_TIPO_CUOTA,');
             SQL.Add('"col$colocacion".AMORTIZA_CAPITAL,"col$colocacion".AMORTIZA_INTERES,');
             SQL.Add('"col$colocacion".PERIODO_GRACIA,"col$colocacion".VALOR_CUOTA,"col$colocacion".ABONOS_CAPITAL,');
             SQL.Add('"col$colocacion".FECHA_CAPITAL,"col$colocacion".FECHA_INTERES,');
             SQL.Add('"col$colocacion".NUMERO_CUENTA,"col$colocacion".NOTA_CONTABLE,');
             SQL.Add('"col$tiposcuota".INTERES,');
             SQL.Add('"gen$empleado".PRIMER_APELLIDO AS PRIMER_APELLIDO1,');
             SQL.Add('"gen$empleado".SEGUNDO_APELLIDO AS SEGUNDO_APELLIDO1,');
             SQL.Add('"gen$empleado".NOMBRE AS NOMBRE1');
             SQL.Add('FROM ');
             SQL.Add('"col$colocacion" INNER JOIN "gen$persona" ON ("col$colocacion".ID_PERSONA = "gen$persona".ID_PERSONA) AND ("col$colocacion".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "gen$tiposidentificacion" ON ("gen$persona".ID_IDENTIFICACION = "gen$tiposidentificacion".ID_IDENTIFICACION)');
             SQL.Add('INNER JOIN "col$clasificacion" ON ("col$colocacion".ID_CLASIFICACION = "col$clasificacion".ID_CLASIFICACION)');
             SQL.Add('INNER JOIN "col$lineas" ON ("col$colocacion".ID_LINEA = "col$lineas".ID_LINEA)');
             SQL.Add('INNER JOIN "col$inversion" ON ("col$colocacion".ID_INVERSION = "col$inversion".ID_INVERSION)');
             SQL.Add('INNER JOIN "col$respaldo" ON ("col$colocacion".ID_RESPALDO = "col$respaldo".ID_RESPALDO)');
             SQL.Add('INNER JOIN "col$garantia" ON ("col$colocacion".ID_GARANTIA = "col$garantia".ID_GARANTIA)');
             SQL.Add('LEFT OUTER JOIN "col$tasasvariables" ON ("col$colocacion".ID_INTERES = "col$tasasvariables".ID_INTERES)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "col$tiposcuota" ON ("col$colocacion".ID_TIPO_CUOTA = "col$tiposcuota".ID_TIPOS_CUOTA)');
             SQL.Add('INNER JOIN "gen$empleado" ON ("col$colocacion".ID_EMPLEADO = "gen$empleado".ID_EMPLEADO) ');
             SQL.Add(' where ID_COLOCACION = :"ID_COLOCACION" and ID_AGENCIA = :"ID_AGENCIA"');
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             Open;
             if RecordCount < 1 then
             begin
               MessageDlg('La Colocación No Existe!',mtError,[mbOK],0);
               Exit;
             end
             else
                vDesembolso := FieldByName('VALOR_DESEMBOLSO').AsCurrency;
                PuntosAdic := FieldByName('PUNTOS_INTERES').AsFloat;
                if FieldByName('INTERES').AsString = 'A' then
                   TasaNominal := TasaNominalAnticipada(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger) + PuntosAdic
                else
                   TasaNominal := TasaNominalVencida(FieldByName('TASA_INTERES_CORRIENTE').AsFloat,FieldByName('AMORTIZA_INTERES').AsInteger) + PuntosAdic;
        end;


        with IBQuerytabla do
        begin
             SQL.Clear;
             SQL.Add('select ID_COLOCACION, CUOTA_NUMERO, FECHA_A_PAGAR, CAPITAL_A_PAGAR, ');
             SQL.Add('INTERES_A_PAGAR,(CAPITAL_A_PAGAR + INTERES_A_PAGAR) as TOTALCUOTA ');
             SQL.Add('from "col$tablaliquidacion" where ');
             SQL.Add('ID_COLOCACION = :"ID_COLOCACION" and ID_AGENCIA = :"ID_AGENCIA" ORDER BY CUOTA_NUMERO');
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             Open;
        end;
        with IBQuerycontable do
        begin
             SQL.Clear;
             SQL.Add('select "col$concol"."ID_COLOCACION","col$concol"."CODIGO","con$puc"."NOMBRE","col$concol"."DEBITO","col$concol"."CREDITO"');
             SQL.Add(' FROM "col$concol" left join "con$puc" ON ');
             SQL.Add('("col$concol"."CODIGO" = "con$puc"."CODIGO" AND "col$concol".ID_AGENCIA = "con$puc".ID_AGENCIA) ');
             SQL.Add('where "col$concol".ID_COLOCACION = :"ID_COLOCACION" AND "col$concol".ID_AGENCIA = :"ID_AGENCIA" ORDER BY CREDITO,"col$concol"."CODIGO"');
             ParamByName('ID_COLOCACION').AsString := vIdColocacion;
             ParamByName('ID_AGENCIA').AsInteger := Agencia;
             Open;
        end;

        with IBQueryGarPersonal do
        begin
           SQL.Clear;
           SQL.Add('select "gen$persona".PRIMER_APELLIDO,"gen$persona".SEGUNDO_APELLIDO,');
           SQL.Add('"gen$persona".NOMBRE,"col$colgarantias".ID_COLOCACION,');
           SQL.Add('"col$colgarantias".ID_PERSONA FROM "col$colgarantias" ');
           SQL.Add('inner join "gen$persona" on ');
           SQL.Add('("col$colgarantias".ID_PERSONA = "gen$persona".ID_PERSONA) and ("col$colgarantias".ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION) ');
           SQL.Add('where ID_COLOCACION = :"ID_COLOCACION" and ID_AGENCIA = :"ID_AGENCIA"');
           ParamByName('ID_COLOCACION').AsString := vIdColocacion;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           Open;
        end;
        with IBQueryGarReal do
        begin
           SQL.Clear;
           SQL.Add('select "col$colgarantiasreal".ID_COLOCACION,"col$colgarantiasreal".NUMERO_ESCRITURA,');
           SQL.Add('"col$colgarantiasreal".FECHA_ESCRITURA,"col$colgarantiasreal".NOMBRE_NOTARIA,');
           SQL.Add('"col$colgarantiasreal".CIUDAD_ESCRITURA,"col$colgarantiasreal".MATRICULA_INMOBILIARIA,');
           SQL.Add('"col$colgarantiasreal".FECHA_REGISTRO,"col$colgarantiasreal".AVALUO,');
           SQL.Add('"col$colgarantiasreal".CUENTAS_DE_ORDEN,"col$colgarantiasreal".POLIZA_INCENDIO,');
           SQL.Add('"col$colgarantiasreal".FECHA_INICIAL_POLIZA,"col$colgarantiasreal".FECHA_FINAL_POLIZA,');
           SQL.Add('"col$colgarantiasreal".VALOR_ASEGURADO ');
           SQL.Add('from "col$colgarantiasreal" where ID_COLOCACION = :"ID_COLOCACION" AND ID_AGENCIA = :"ID_AGENCIA"');
           ParamByName('ID_COLOCACION').AsString := vIdColocacion;
           ParamByName('ID_AGENCIA').AsInteger := Agencia;
           Open;
        end;


        Saldo := vDesembolso;
        Report.Variables.ByName['Empresa'].AsString := Empresa;
        Report.Variables.ByName['Hoy'].AsDateTime := Date;
        Report.Variables.ByName['Desembolso'].AsDouble := vDesembolso;
        Report.Variables.ByName['TasaNominal'].AsDouble := TasaNominal;        

{        if Report.PrepareReport then
        begin
              frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
              frmVistaPreliminar.Reporte := Report;
              frmVistaPreliminar.ShowModal;
        end;    }
        If Report.PrepareReport then
           Report.PreviewPreparedReport(true);        

        IBQuerytabla.Close;
        IBQuerycontable.Close;
        IBQuerycolocacion.Close;
        IBQueryGarPersonal.Close;
        IBQueryGarReal.Close;
end;


procedure TfrmRecuperarInformeColocacion.EdColocacionExit(Sender: TObject);
begin
        vIdColocacion := EdColocacion.Text;
end;

procedure TfrmRecuperarInformeColocacion.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmRecuperarInformeColocacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        DmColocacion.Free;
        Action := caFree;
end;


procedure TfrmRecuperarInformeColocacion.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmRecuperarInformeColocacion.EdColocacionKeyPress(
  Sender: TObject; var Key: Char);
begin
        NumericoSinPunto(Sender,Key);
end;

procedure TfrmRecuperarInformeColocacion.ReportUnknownObjFunction(
  Sender: TObject; Component: TComponent; const FuncName: String;
  const Parameters: TprVarsArray; ParametersCount: Integer;
  var Value: TprVarValue; var IsProcessed: Boolean);
var   f : TField;
begin
if (Component=IBQuerytabla) and
   (AnsiCompareText(FuncName,'IBQuerytabla.Field')=0) and
   (ParametersCount=1) then
  begin
    // Parameter with index 0 is the fieldname
    f := IBQuerytabla.FindField(_vAsString(Parameters[0]));
    if f<>nil then
      begin
        // field is found return length of field value
        Saldo := Saldo - f.AsCurrency;
        _vSetAsDouble(Value,Saldo);
        IsProcessed := true;
      end
  end


end;

procedure TfrmRecuperarInformeColocacion.FormShow(Sender: TObject);
begin
        if DmColocacion.IBDScolocacion.Transaction.InTransaction Then
           DmColocacion.IBDScolocacion.Transaction.Commit;
        DmColocacion.IBDScolocacion.Transaction.StartTransaction;
end;

procedure TfrmRecuperarInformeColocacion.FormCreate(Sender: TObject);
begin
        DmColocacion := TDmColocacion.Create(Self);
end;

end.
