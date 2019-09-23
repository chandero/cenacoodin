unit UnitOperacionesEfectivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, JvEdit, JvTypedEdit, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBQuery, pr_Common, pr_TxClasses, pr_Parser, DBClient,
  pr_Classes, IBSQL, DateUtils, StrUtils;

type
  TfrmOperacionesEfectivo = class(TForm)
    Panel1: TPanel;
    cmdProcesar: TBitBtn;
    cmdReporte: TBitBtn;
    cmdCerrar: TBitBtn;
    IBQuery1: TIBQuery;
    GroupBox2: TGroupBox;
    chkAhorros: TCheckBox;
    chkCartera: TCheckBox;
    chkReporte: TCheckBox;
    IBQuery2: TIBQuery;
    IBTabla: TClientDataSet;
    IBTablaFECHA_MOV: TDateTimeField;
    IBTablaID_TIPO: TIntegerField;
    IBTablaNUMERO: TStringField;
    IBTablaPRIMER_APELLIDO: TStringField;
    IBTablaSEGUNDO_APELLIDO: TStringField;
    IBTablaNOMBRE: TStringField;
    IBTablaID_TIPO_MOVIMIENTO: TIntegerField;
    IBTablaVALOR: TCurrencyField;
    IBTablaID_PERSONA: TStringField;
    Rg1: TRadioGroup;
    Panel2: TPanel;
    Label1: TLabel;
    EdMonto: TJvCurrencyEdit;
    Label2: TLabel;
    EdFechaI: TDateTimePicker;
    Label3: TLabel;
    EdFechaF: TDateTimePicker;
    ReporteG: TprReport;
    Reporte: TprTxReport;
    CDagencias: TClientDataSet;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    IntegerField2: TIntegerField;
    CurrencyField1: TCurrencyField;
    IBQuery3: TIBQuery;
    IBTablaPERSONA: TStringField;
    IBQuery4: TIBQuery;
    procedure cmdCerrarClick(Sender: TObject);
    procedure cmdProcesarClick(Sender: TObject);
    procedure EdFechaFChange(Sender: TObject);
    procedure EdFechaIChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cmdReporteClick(Sender: TObject);
    procedure ReporteUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure ReporteGUnknownVariable(Sender: TObject;
      const VarName: String; var Value: TprVarValue;
      var IsProcessed: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    procedure EfectivoAgencias;
    procedure BuscaPersona(_sIdpersona :string);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOperacionesEfectivo: TfrmOperacionesEfectivo;
  _sSalida :string;
  Entradas:Integer;
  Salidas :Integer;
  TotEntradas:Currency;
  TotSalidas:Currency;
  EntradasAg:Integer;
  SalidasAg :Integer;
  TotEntradasAG:Currency;
  TotSalidasAg:Currency;


implementation

{$R *.dfm}

uses unitDmGeneral,unitGlobales,unitPantallaProgreso;

procedure TfrmOperacionesEfectivo.cmdCerrarClick(Sender: TObject);
begin
        Close;
end;

procedure TfrmOperacionesEfectivo.cmdProcesarClick(Sender: TObject);
begin
        Rg1.ItemIndex := 1;
        cmdProcesar.Enabled := False;
        Panel2.Enabled := False;
        Application.ProcessMessages;
        if dmGeneral.IBTransaction1.InTransaction then
           dmGeneral.IBTransaction1.Rollback;
        dmGeneral.IBTransaction1.StartTransaction;

        EdFechaI.Time := StrToTime('00:00:00');
        EdFechaF.Time := StrToTime('23:59:59');        
// Procesar Captaciones A la Vista
        with IBQuery1 do begin
            Close;
            ParamByName('FECHA1').AsDateTime := EdFechaI.DateTime;
            ParamByName('FECHA2').AsDateTime := EdFechaF.DateTime;
            ParamByName('VALOR').AsCurrency := EdMonto.Value;
            try
             Open;
            except
             Transaction.Rollback;
             raise;
            end;
        end;

        chkAhorros.Checked := True;

        with IBQuery2 do begin
            Close;
            ParamByName('FECHA1').AsDateTime := EdFechaI.DateTime;
            ParamByName('FECHA2').AsDateTime := EdFechaF.DateTime;
            ParamByName('VALOR').AsCurrency := EdMonto.Value;
            try
             Open;
            except
             Transaction.Rollback;
             raise;
            end;
        end;

        chkCartera.Checked := True;

        with IBQuery1 do begin
           First;
           while not Eof do
           begin
             IBTabla.Open;
             IBTabla.Insert;
             IBTabla.FieldByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
             IBTabla.FieldByName('ID_TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
             IBTabla.FieldByName('NUMERO').AsString := Format('%.6d',[FieldByName('NUMERO_CUENTA').AsInteger]);
             IBTabla.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
             IBTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
             IBTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
             IBTabla.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
             IBTabla.FieldByName('VALOR').AsCurrency := FieldByName('BILLETES').AsCurrency;
             BuscaPersona(FieldByName('PERSONA').AsString);
             IBTabla.FieldByName('PERSONA').AsString := _sSalida;
             IBTabla.Post;
             IBTabla.Close;
             Next;
           end;
        end;

        with IBQuery2 do begin
           First;
           while not Eof do
           begin
             IBTabla.Open;
             IBTabla.Insert;
             IBTabla.FieldByName('FECHA_MOV').AsDateTime := FieldByName('FECHA_MOV').AsDateTime;
             IBTabla.FieldByName('ID_TIPO').AsInteger := FieldByName('ID_TIPO_CAPTACION').AsInteger;
             IBTabla.FieldByName('NUMERO').AsString := FieldByName('ID_COLOCACION').AsString;
             IBTabla.FieldByName('ID_PERSONA').AsString := FieldByName('ID_PERSONA').AsString;
             IBTabla.FieldByName('PRIMER_APELLIDO').AsString := FieldByName('PRIMER_APELLIDO').AsString;
             IBTabla.FieldByName('SEGUNDO_APELLIDO').AsString := FieldByName('SEGUNDO_APELLIDO').AsString;
             IBTabla.FieldByName('NOMBRE').AsString := FieldByName('NOMBRE').AsString;
             IBTabla.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger := FieldByName('ID_TIPO_MOVIMIENTO').AsInteger;
             IBTabla.FieldByName('VALOR').AsCurrency := FieldByName('BILLETES').AsCurrency;
             BuscaPersona(FieldByName('PERSONA').AsString);
             IBTabla.FieldByName('PERSONA').AsString := _sSalida;
             IBTabla.Post;
             IBTabla.Close;
             Next;
           end;
        end;
        with IBQuery3 do begin
            Close;
            ParamByName('FECHA1').AsDateTime := EdFechaI.DateTime;
            ParamByName('FECHA2').AsDateTime := EdFechaF.DateTime;
            ParamByName('VMAXIMO').AsCurrency := EdMonto.Value;
            try
             Open;
            except
             Transaction.Rollback;
             raise;
            end;
        end;
        IBQuery1.Close;
        IBQuery2.Close;

        chkReporte.Checked := True;


        cmdReporte.Enabled := True;
        cmdReporte.Click;

end;

procedure TfrmOperacionesEfectivo.EdFechaFChange(Sender: TObject);
begin
        if EdFechaF.Date < EdFechaI.Date then
           EdFechaF.Date := EdFechaI.Date;

        EdFechaF.Time := StrToTime('23:59:59');
end;

procedure TfrmOperacionesEfectivo.EdFechaIChange(Sender: TObject);
begin
        if EdFechaI.Date > EdFechaF.Date then
           EdFechaI.Date := EdFechaF.Date;

        EdFechaI.Time := StrToTime('00:00:00');
end;

procedure TfrmOperacionesEfectivo.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
        EnterTabs(Key,Self);
end;

procedure TfrmOperacionesEfectivo.cmdReporteClick(Sender: TObject);
begin

        Entradas := 0;
        Salidas  := 0;
        TotEntradas := 0;
        TotSalidas  := 0;
        EntradasAg  := 0;
        SalidasAg  := 0;
        TotEntradasAg := 0;
        TotSalidasAg  := 0;

        
        case Rg1.ItemIndex of
        1: begin
                Reporte.Variables.ByName['EMPRESA'].AsString := Empresa;
                Reporte.Variables.ByName['AGENCIA'].AsString := Ciudad;
                Reporte.Variables.ByName['FECHA_INICIAL'].AsDateTime := EdFechaI.Date;
                Reporte.Variables.ByName['FECHA_FINAL'].AsDateTime := EdFechaF.Date;
                Reporte.Variables.ByName['MONTO'].AsDouble := EdMonto.Value;

                if Reporte.PrepareReport then
                   Reporte.PreviewPreparedReport(True);
            end;
        0: begin
                ReporteG.Variables.ByName['EMPRESA'].AsString := Empresa;
                ReporteG.Variables.ByName['AGENCIA'].AsString := Ciudad;
                ReporteG.Variables.ByName['FECHA_INICIAL'].AsDateTime := EdFechaI.Date;
                ReporteG.Variables.ByName['FECHA_FINAL'].AsDateTime := EdFechaF.Date;
                ReporteG.Variables.ByName['MONTO'].AsDouble := EdMonto.Value;
                ReporteG.Variables.ByName['AG'].AsDouble := agencia;
                if ReporteG.PrepareReport then
                   ReporteG.PreviewPreparedReport(True);
            end;
        end;
      
end;

procedure TfrmOperacionesEfectivo.ReporteUnknownVariable(Sender: TObject;
  const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);
begin
        if VarName = 'CSC_E' then
        begin
          if IBTabla.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then begin
            Entradas := Entradas + 1;
            TotEntradas := TotEntradas + IBTabla.FieldByName('VALOR').AsCurrency;
            _vSetAsInteger(Value,Entradas);
          end
          else
            _vSetAsInteger(Value,0);
        end;

        if VarName = 'CSC_S' then
        begin
          if IBTabla.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 2 then begin
            TotSalidas := TotSalidas + IBTabla.FieldByName('VALOR').AsCurrency;
            Salidas := Salidas + 1;
            _vSetAsInteger(Value,Salidas);
          end
          else
            _vSetAsInteger(Value,0);

        end;
//**   AGENCIAS REMOTAS
        if VarName = 'CSC_1' then
        begin
          if IBQuery3.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then begin
            EntradasAg := EntradasAg + 1;
            TotEntradasAg := TotEntradasAg + IBQuery3.FieldByName('BILLETES').AsCurrency;
            _vSetAsInteger(Value,EntradasAg);
          end
          else
            _vSetAsInteger(Value,0);
        end;

        if VarName = 'CSC_2' then
        begin
          if IBQuery3.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 2 then begin
            TotSalidasAg := TotSalidasAg + IBQuery3.FieldByName('BILLETES').AsCurrency;
            SalidasAg := SalidasAg + 1;
            _vSetAsInteger(Value,SalidasAg);
          end
          else
            _vSetAsInteger(Value,0);
        end;

//***

        if VarName = 'OPE1' then
           _vSetAsInteger(Value,Entradas);
        if VarName = 'OPE2' then
           _vSetAsInteger(Value,Salidas);

        if VarName = 'TOT1' then
           _vSetAsDouble(Value,TotEntradas);
        if VarName = 'TOT2' then
           _vSetAsDouble(Value,TotSalidas);
//** AGENCIAS REMOTAS
        if VarName = 'OPAG1' then
           _vSetAsInteger(Value,EntradasAg);
        if VarName = 'OPAG2' then
           _vSetAsInteger(Value,SalidasAg);

        if VarName = 'TOTAG1' then
           _vSetAsDouble(Value,TotEntradasAg);
        if VarName = 'TOTAG2' then
           _vSetAsDouble(Value,TotSalidasAg);

//**
        IsProcessed := True;
end;

procedure TfrmOperacionesEfectivo.ReporteGUnknownVariable(Sender: TObject;
  const VarName: String; var Value: TprVarValue; var IsProcessed: Boolean);
var     _sIdPersonaOp :string;
begin
        if VarName = 'CSC_E' then
        begin
          if IBTabla.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then begin
            Entradas := Entradas + 1;
            TotEntradas := TotEntradas + IBTabla.FieldByName('VALOR').AsCurrency;
            _vSetAsInteger(Value,Entradas);
          end
          else
            _vSetAsInteger(Value,0);
        end;

        if VarName = 'CSC_S' then
        begin
          if IBTabla.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 2 then begin
            Salidas := Salidas + 1;
            TotSalidas := TotSalidas + IBTabla.FieldByName('VALOR').AsCurrency;
            _vSetAsInteger(Value,Salidas);
          end
          else
            _vSetAsInteger(Value,0);
        end;
        //**   AGENCIAS REMOTAS
        if VarName = 'CSC_1' then
        begin
          if IBQuery3.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 1 then begin
            EntradasAg := EntradasAg + 1;
            TotEntradasAg := TotEntradasAg + IBQuery3.FieldByName('BILLETES').AsCurrency;
            _vSetAsInteger(Value,EntradasAg);
          end
          else
            _vSetAsInteger(Value,0);
        end;

        if VarName = 'CSC_2' then
        begin
          if IBQuery3.FieldByName('ID_TIPO_MOVIMIENTO').AsInteger = 2 then begin
            TotSalidasAg := TotSalidasAg + IBQuery3.FieldByName('BILLETES').AsCurrency;
            SalidasAg := SalidasAg + 1;
            _vSetAsInteger(Value,SalidasAg);
          end
          else
            _vSetAsInteger(Value,0);
        end;
   //***


        if VarName = 'OPE1' then
           _vSetAsInteger(Value,Entradas);
        if VarName = 'OPE2' then
           _vSetAsInteger(Value,Salidas);

        if VarName = 'TOT1' then
           _vSetAsDouble(Value,TotEntradas);
        if VarName = 'TOT2' then
           _vSetAsDouble(Value,TotSalidas);
//** AGENCIAS REMOTAS
        if VarName = 'OPAG1' then
           _vSetAsInteger(Value,EntradasAg);
        if VarName = 'OPAG2' then
           _vSetAsInteger(Value,SalidasAg);

        if VarName = 'TOTAG1' then
           _vSetAsDouble(Value,TotEntradasAg);
        if VarName = 'TOTAG2' then
           _vSetAsDouble(Value,TotSalidasAg);

//**
       if VarName = 'PERSONA' then
       begin
         _sIdPersonaOp := IBQuery3.FieldByName('ID_PERSONA_OP').AsString;
         BuscaPersona(_sIdPersonaOp);
         _vSetAsString(Value,UpperCase(_sSalida));
       end;
        IsProcessed := True;

end;

procedure TfrmOperacionesEfectivo.EfectivoAgencias;
begin
        //with IBSQL1 do
end;

procedure TfrmOperacionesEfectivo.FormCreate(Sender: TObject);
var
  FechaHoy:TDate;
begin
  FechaHoy := fFechaActual;
  FechaHoy := FechaHoy - 30;
  EdFechaI.Date := encodedate(Yearof(FechaHoy),MonthOf(FechaHoy),01);
  EdFechaF.Date := encodedate(Yearof(FechaHoy),Monthof(FechaHoy),DaysInAMonth(Yearof(FechaHoy),Monthof(FechaHoy)));
  EdFechaI.Time := strtotime('00:00:00');
  EdFechaF.Time := strtotime('23:59:59');
end;
procedure TfrmOperacionesEfectivo.BuscaPersona(_sIdPersona:string);
begin
   IBQuery4.Close;
   IBQuery4.ParamByName('ID_PERSONA').AsString := _sIdpersona;
   IBQuery4.Open;
   if IBQuery4.RecordCount > 0 then
      _sSalida := _sIdpersona + ' - ' + IBQuery4.FieldByName('PERSONA').AsString
   else
      _sSalida := '';
end;
end.
