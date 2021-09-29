unit UnitInformeAuxiliar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_Parser, IBSQL,
  DBCtrls,StrUtils;

type
  TfrmInformeAuxiliares = class(TForm)
    Panel1: TPanel;
    EdFechaInicial: TDateTimePicker;
    EdFechaFinal: TDateTimePicker;
    Label1: TLabel;
    EdCodigoInicial: TMaskEdit;
    Label2: TLabel;
    EdCodigoFinal: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    CmdAceptar: TBitBtn;
    CmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    IBQuery: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery1ID_AGENCIA: TSmallintField;
    IBQuery1ID_COMPROBANTE: TIntegerField;
    IBQuery1CODIGO: TIBStringField;
    IBQuery1DEBITO: TIBBCDField;
    IBQuery1CREDITO: TIBBCDField;
    IBQuery1ID_PERSONA: TIBStringField;
    IBQuery1ESTADOAUX: TIBStringField;
    IBQuery1FECHADIA: TDateField;
    IBQuery1DESCRIPCION: TMemoField;
    IBQuery1NOMBRE: TIBStringField;
    IBQuery1SALDOINICIAL: TIBBCDField;
    IBQuery1DESCRIPCION_AGENCIA: TIBStringField;
    IBQuery1NOMBRE1: TIBStringField;
    IBQuery1PRIMER_APELLIDO: TIBStringField;
    IBQuery1SEGUNDO_APELLIDO: TIBStringField;
    EdCtaI: TStaticText;
    EdCtaF: TStaticText;
    IBSQL1: TIBSQL;
    RGTipo: TRadioGroup;
    ReportAuxiliar: TprTxReport;
    GBDocumento: TGroupBox;
    IBTipoDocumento: TIBQuery;
    CBtiposid: TDBLookupComboBox;
    EdNumeroIdentificacion: TMemo;
    DSTipoDocumento: TDataSource;
    procedure EdCodigoInicialExit(Sender: TObject);
    procedure EdCodigoFinalExit(Sender: TObject);
    procedure EdCodigoInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodigoFinalKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInicialKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaFinalKeyPress(Sender: TObject; var Key: Char);
    procedure EdFechaInicialExit(Sender: TObject);
    procedure EdFechaFinalExit(Sender: TObject);
    procedure CmdAceptarClick(Sender: TObject);
    procedure CmdCerrarClick(Sender: TObject);
    procedure ReportAuxiliarUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormShow(Sender: TObject);
  private
    function Empleado : String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInformeAuxiliares: TfrmInformeAuxiliares;
  CodigoInicial : String;
  CodigoFinal   : String;
  FechaInicial  : TDate;
  FechaFinal    : TDate;
  Cadena        : String;
  SaldoMovimiento : Currency;
  SaldoInicial : Currency;
  CodigoGrupo :  String;
  SumaSaldoCodigo : Currency;

implementation

{$R *.dfm}

uses UnitGlobales, UnitdmGeneral, UnitVistaPreliminar;

procedure TfrmInformeAuxiliares.EdCodigoInicialExit(Sender: TObject);
begin
        Cadena := EdCodigoInicial.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoInicial := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := CodigoInicial;
         ExecQuery;
         if RecordCount > 0 then
            EdCtaI.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaI.Caption := 'NO SE ENCONTRO CODIGO';
        end;
end;

procedure TfrmInformeAuxiliares.EdCodigoFinalExit(Sender: TObject);
begin
        Cadena := EdCodigoFinal.Text;
        while Pos(' ',Cadena) > 0 do
        Cadena[Pos(' ',Cadena)] := '0';
        CodigoFinal := Cadena;
        with IBSQL1 do begin
         Close;
         ParamByName('CODIGO').AsString := CodigoFinal;
         ExecQuery;
         if RecordCount > 0 then
            EdCtaF.Caption := FieldByName('NOMBRE').AsString
         else
            EdCtaF.Caption := 'NO SE ENCONTRO CODIGO';
        end;


end;

procedure TfrmInformeAuxiliares.EdCodigoInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeAuxiliares.EdCodigoFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeAuxiliares.EdFechaInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeAuxiliares.EdFechaFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmInformeAuxiliares.EdFechaInicialExit(Sender: TObject);
begin
        FechaInicial := EdFechaInicial.Date;
end;

procedure TfrmInformeAuxiliares.EdFechaFinalExit(Sender: TObject);
begin
        FechaFinal := EdFechaFinal.Date;
end;

procedure TfrmInformeAuxiliares.CmdAceptarClick(Sender: TObject);
var
frmVistaPreliminar:TfrmVistaPreliminar;
NomAgencia : String;
begin
        With IBQuery1 do
         begin
           SQL.Clear;
           SQL.Add('select');
           SQL.Add('CON$COMPROBANTE.ID_AGENCIA,');
           SQL.Add('CON$COMPROBANTE.ID_COMPROBANTE,');
           SQL.Add('CON$AUXILIAR.CODIGO,');
           SQL.Add('CON$AUXILIAR.DEBITO,');
           SQL.Add('CON$AUXILIAR.CREDITO,');
           SQL.Add('CON$AUXILIAR.ID_PERSONA,');
           SQL.Add('CON$AUXILIAR.ESTADOAUX,');
           SQL.Add('CON$COMPROBANTE.FECHADIA,');
           SQL.Add('CON$COMPROBANTE.DESCRIPCION,');
           SQL.Add('CON$PUC.NOMBRE,');
           SQL.Add('CON$PUC.SALDOINICIAL,');
           SQL.Add('"gen$agencia".DESCRIPCION_AGENCIA,');
           SQL.Add('"gen$persona".NOMBRE as NOMBRE1,');
           SQL.Add('"gen$persona".PRIMER_APELLIDO,');
           SQL.Add('"gen$persona".SEGUNDO_APELLIDO');
           SQL.Add('from CON$COMPROBANTE');
           SQL.Add('LEFT JOIN CON$AUXILIAR ON (CON$AUXILIAR.ID_AGENCIA = CON$COMPROBANTE.ID_AGENCIA and CON$AUXILIAR.ID_COMPROBANTE = CON$COMPROBANTE.ID_COMPROBANTE)');
           SQL.Add('LEFT JOIN CON$PUC ON (CON$AUXILIAR.CODIGO = CON$PUC.CODIGO)');
           SQL.Add('LEFT JOIN "gen$agencia" ON (CON$COMPROBANTE.ID_AGENCIA = "gen$agencia".ID_AGENCIA)');
           SQL.Add('LEFT JOIN "gen$persona" ON (CON$AUXILIAR.ID_IDENTIFICACION = "gen$persona".ID_IDENTIFICACION and CON$AUXILIAR.ID_PERSONA = "gen$persona".ID_PERSONA)');
           SQL.Add('where');
           SQL.Add('(CON$COMPROBANTE.FECHADIA >= :"FECHA_INICIAL" and CON$COMPROBANTE.FECHADIA <= :"FECHA_FINAL") and');
           SQL.Add('(CON$AUXILIAR.CODIGO >= :"CODIGO_INICIAL" and CON$AUXILIAR.CODIGO <= :"CODIGO_FINAL")');

           ParamByName('FECHA_INICIAL').AsDate := EdFechaInicial.Date;
           ParamByName('FECHA_FINAL').AsDate := EdFechaFinal.Date;
           ParamByName('CODIGO_INICIAL').AsString := CodigoInicial;
           ParamByName('CODIGO_FINAL').AsString := CodigoFinal;
           case RGTipo.ItemIndex of
           0: begin
              SQL.Add('and ((CON$COMPROBANTE.ESTADO = :"ESTADOAUX1") or (CON$COMPROBANTE.ESTADO = :"ESTADOAUX2"))');
              ParamByName('ESTADOAUX1').AsString := 'C';
              ParamByName('ESTADOAUX2').AsString := 'O';
              ReportAuxiliar.Variables.ByName['Estado'].AsString := 'TODOS';
              end;
           1: begin
              SQL.Add('and (CON$COMPROBANTE.ESTADO = :"ESTADOAUX")');
              ParamByName('ESTADOAUX').AsString := 'C';
              ReportAuxiliar.Variables.ByName['Estado'].AsString := 'CERRADOS';
              end;
           end;
           //CON$AUXILIAR.FECHA Ojo cambio
           SQL.Add('order by CON$AUXILIAR.CODIGO, CON$COMPROBANTE.FECHADIA, CON$AUXILIAR.ID_COMPROBANTE, CON$AUXILIAR.CREDITO');
           Open;
           NomAgencia := FieldByName('DESCRIPCION_AGENCIA').AsString;
          end;


          ReportAuxiliar.Variables.ByName['Empresa'].AsString := Empresa;
          ReportAuxiliar.Variables.ByName['FechaI'].AsDateTime := FechaInicial;
          ReportAuxiliar.Variables.ByName['FechaF'].AsDateTime := FechaFinal;
          ReportAuxiliar.Variables.ByName['CodigoI'].AsString := CodigoInicial;
          ReportAuxiliar.Variables.ByName['CodigoF'].AsString := CodigoFinal;
          ReportAuxiliar.Variables.ByName['Hoy'].AsDateTime := Now;
          ReportAuxiliar.Variables.ByName['NomAgencia'].AsString := NomAgencia;
          ReportAuxiliar.Variables.ByName['Empleado'].AsString := Empleado;

          if ReportAuxiliar.PrepareReport then
          begin
             frmVistaPreliminar := TfrmVistaPreliminar.Create(Self);
             frmVistaPreliminar.Reporte := ReportAuxiliar;
             frmVistaPreliminar.ShowModal;
          end;
end;

procedure TfrmInformeAuxiliares.CmdCerrarClick(Sender: TObject);
begin
        Close;
end;

function TfrmInformeAuxiliares.Empleado:String;
begin
        with IBQuery do
         begin
           sql.Clear;
           sql.Add('select PRIMER_APELLIDO, SEGUNDO_APELLIDO, NOMBRE from "gen$empleado"');
           sql.Add('where "gen$empleado"."ID_EMPLEADO" =:"ID_EMPLEADO"');
           ParamByName('ID_EMPLEADO').AsString := DBAlias;
           Open;
           Result := FieldByName('NOMBRE').AsString + ' ' + FieldByname('PRIMER_APELLIDO').AsString + ' ' + FieldByName('SEGUNDO_APELLIDO').AsString;
         end;
end;

procedure TfrmInformeAuxiliares.ReportAuxiliarUnknownVariable(
  Sender: TObject; const VarName: String; var Value: TprVarValue;
  var IsProcessed: Boolean);
var
PrimerSaldo : Currency;
Nombres : String;
begin
    if VarName = 'SALDOINICIAL' then
     begin
      PrimerSaldo := IBQuery1.FieldByName('SALDOINICIAL').AsCurrency ;
      CodigoGrupo := IBQuery1.fieldByName('CODIGO').AsString;
      SaldoMovimiento := 0;
      with IBQuery2 do
       begin
         Close;
         SQL.Clear;
         SQL.Add('Select ');
         SQL.Add('CON$AUXILIAR.DEBITO,');
         SQL.Add('CON$AUXILIAR.CREDITO,');
         SQL.Add('CON$AUXILIAR.FECHA');
         SQL.Add('from CON$AUXILIAR');
         SQL.Add('where ');
         SQL.Add('(CON$AUXILIAR.ID_AGENCIA =:"ID_AGENCIA") and');
         SQL.Add('(CON$AUXILIAR.CODIGO =:"CODIGO") and');
         SQL.Add('(CON$AUXILIAR.FECHA <:"FECHA_INICIAL")');
         ParamByName('ID_AGENCIA').AsInteger := Agencia;
         ParamByName('CODIGO').AsString := CodigoGrupo;
         ParamByName('FECHA_INICIAL').AsDate := EdFechaInicial.Date;
           case RGTipo.ItemIndex of
           0: begin
              SQL.Add('and ((CON$AUXILIAR.ESTADOAUX = :"ESTADOAUX1") or (CON$AUXILIAR.ESTADOAUX = :"ESTADOAUX2"))');
              ParamByName('ESTADOAUX1').AsString := 'C';
              ParamByName('ESTADOAUX2').AsString := 'O';
              end;
           1: begin
              SQL.Add('and (CON$AUXILIAR.ESTADOAUX = :"ESTADOAUX")');
              ParamByName('ESTADOAUX').AsString := 'C';
              end;
           end;

         Open;

         IBQuery2.Last;
         IBQuery2.First;
         SaldoInicial := PrimerSaldo;
         While not IBQuery2.Eof do
          begin
            SaldoInicial := SaldoInicial +
                            (FieldByName('DEBITO').AsCurrency -
                            FieldByName('CREDITO').AsCurrency);
            next;
          end;
         _vSetAsDouble(Value,SaldoInicial);
         IsProcessed := True;
       end;
       SaldoMovimiento := SaldoInicial;
    end;

    if VarName = 'SALDOACTUAL' then
     begin
      SaldoMovimiento :=  SaldoMovimiento +
               (IBQuery1.FieldByName('DEBITO').AsCurrency -
                IBQuery1.FieldByName('CREDITO').AsCurrency);
      SumaSaldoCodigo := SaldoMovimiento;
      _vSetAsDouble(Value,SaldoMovimiento);
      IsProcessed := True;
     end;

    if (VarName = 'BENEFICIARIO') then
     begin
      try
        Nombres := trim(IBQuery1.FieldByName('NOMBRE1').AsString) + ' ' +
                 trim(IBQuery1.FieldByName('PRIMER_APELLIDO').AsString) + ' ' +
                 trim(IBQuery1.FieldByName('SEGUNDO_APELLIDO').AsString);
      except
      end;
      _vSetAsString(Value,Nombres);
      IsProcessed := True;
     end;


end;

procedure TfrmInformeAuxiliares.FormShow(Sender: TObject);
begin
        EdFechaInicial.Date := Date;
        EdFechaFinal.Date := Date;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Commit;
        dmGeneral.IBTransaction1.StartTransaction;
end;

end.
